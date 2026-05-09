; DESCRIPTION: Composite: Places a white line segment connecting (297, 241) to (146, 213) then Places a magenta dot at position (301, 168) then Renders a cyan box of size 26x13 starting at (386, 192).
; PLAN: r0=297(x1), r1=241(y1), r2=146(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=168(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=386(x), r11=192(y), r12=26(width), r13=13(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 241
LDI r2, 146
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 168
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 386
LDI r11, 192
LDI r12, 26
LDI r13, 13
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
