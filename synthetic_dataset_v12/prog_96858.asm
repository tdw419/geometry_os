; DESCRIPTION: Composite: Places a green dot at position (43, 152) then Renders a magenta line between points (164, 188) and (271, 221).
; PLAN: r0=43(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=188(y1), r7=271(x2), r8=221(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 164
LDI r6, 188
LDI r7, 271
LDI r8, 221
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
