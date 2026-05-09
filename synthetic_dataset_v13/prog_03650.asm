; DESCRIPTION: Composite: Draws a white line from (393, 171) to (224, 171) then Renders a purple box of size 49x42 starting at (458, 153).
; PLAN: r0=393(x1), r1=171(y1), r2=224(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=153(y), r7=49(width), r8=42(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 171
LDI r2, 224
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 153
LDI r7, 49
LDI r8, 42
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
