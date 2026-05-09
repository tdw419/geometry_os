; DESCRIPTION: Composite: Places a orange 68x27 rectangle at position (275, 191) then Draws a red line from (509, 148) to (346, 133).
; PLAN: r0=275(x), r1=191(y), r2=68(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=509(x1), r6=148(y1), r7=346(x2), r8=133(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 191
LDI r2, 68
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 148
LDI r7, 346
LDI r8, 133
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
