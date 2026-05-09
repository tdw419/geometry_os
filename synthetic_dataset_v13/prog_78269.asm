; DESCRIPTION: Renders a cyan line between points (279, 0) and (420, 236).
; PLAN: r0=279(x1), r1=0(y1), r2=420(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 0
LDI r2, 420
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
