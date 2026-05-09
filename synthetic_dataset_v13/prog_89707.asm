; DESCRIPTION: Composite: Places a cyan line segment connecting (213, 74) to (437, 58) then Places a cyan dot at position (383, 180) then Renders a cyan box of size 57x68 starting at (284, 187).
; PLAN: r0=213(x1), r1=74(y1), r2=437(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=180(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=187(y), r12=57(width), r13=68(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 74
LDI r2, 437
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 180
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 187
LDI r12, 57
LDI r13, 68
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
