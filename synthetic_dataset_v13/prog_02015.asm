; DESCRIPTION: Composite: Places a green dot at position (202, 99) then Renders a purple line between points (253, 213) and (386, 209).
; PLAN: r0=202(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=253(x1), r6=213(y1), r7=386(x2), r8=209(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 253
LDI r6, 213
LDI r7, 386
LDI r8, 209
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
