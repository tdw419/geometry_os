; DESCRIPTION: Renders a cyan line between points (281, 199) and (413, 242).
; PLAN: r0=281(x1), r1=199(y1), r2=413(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 199
LDI r2, 413
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
