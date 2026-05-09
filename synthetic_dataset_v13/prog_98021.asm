; DESCRIPTION: Composite: Draws a white line from (469, 178) to (405, 237) then Renders a white box of size 33x116 starting at (265, 103).
; PLAN: r0=469(x1), r1=178(y1), r2=405(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=103(y), r7=33(width), r8=116(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 178
LDI r2, 405
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 103
LDI r7, 33
LDI r8, 116
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
