; DESCRIPTION: Composite: Renders a orange line between points (317, 103) and (256, 49) then Creates a cyan rectangular region at (410, 114) spanning 39 by 69 pixels.
; PLAN: r0=317(x1), r1=103(y1), r2=256(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=114(y), r7=39(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 103
LDI r2, 256
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 114
LDI r7, 39
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
