; DESCRIPTION: Renders a cyan line between points (27, 37) and (334, 215).
; PLAN: r0=27(x1), r1=37(y1), r2=334(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 37
LDI r2, 334
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
