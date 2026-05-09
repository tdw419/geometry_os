; DESCRIPTION: Composite: Renders a blue box of size 103x42 starting at (280, 138) then Draws a white line from (321, 126) to (277, 162).
; PLAN: r0=280(x), r1=138(y), r2=103(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=126(y1), r7=277(x2), r8=162(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 138
LDI r2, 103
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 126
LDI r7, 277
LDI r8, 162
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
