; DESCRIPTION: Renders a cyan line between points (209, 86) and (48, 242).
; PLAN: r0=209(x1), r1=86(y1), r2=48(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 86
LDI r2, 48
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
