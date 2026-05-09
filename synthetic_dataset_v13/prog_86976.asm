; DESCRIPTION: Draws a cyan line from (426, 196) to (245, 138).
; PLAN: r0=426(x1), r1=196(y1), r2=245(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 196
LDI r2, 245
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
