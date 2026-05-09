; DESCRIPTION: Composite: Places a magenta dot at position (29, 209) then Renders a magenta line between points (199, 76) and (65, 225) then Renders a magenta box of size 38x60 starting at (126, 177).
; PLAN: r0=29(x), r1=209(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=199(x1), r6=76(y1), r7=65(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=126(x), r11=177(y), r12=38(width), r13=60(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 29
LDI r1, 209
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 76
LDI r7, 65
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 126
LDI r11, 177
LDI r12, 38
LDI r13, 60
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
