; DESCRIPTION: Composite: Places a yellow 82x62 rectangle at position (215, 3) then Draws a red line from (368, 114) to (171, 70).
; PLAN: r0=215(x), r1=3(y), r2=82(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x1), r6=114(y1), r7=171(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 3
LDI r2, 82
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 114
LDI r7, 171
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
