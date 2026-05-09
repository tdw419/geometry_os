; DESCRIPTION: Composite: Sets a single cyan pixel at (236, 85) then Draws a white line from (354, 8) to (56, 203) then Renders a white box of size 98x82 starting at (373, 124).
; PLAN: r0=236(x), r1=85(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=8(y1), r7=56(x2), r8=203(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=124(y), r12=98(width), r13=82(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 85
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 8
LDI r7, 56
LDI r8, 203
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 124
LDI r12, 98
LDI r13, 82
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
