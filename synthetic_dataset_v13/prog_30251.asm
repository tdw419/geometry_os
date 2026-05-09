; DESCRIPTION: Renders a cyan line between points (382, 254) and (435, 249).
; PLAN: r0=382(x1), r1=254(y1), r2=435(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 254
LDI r2, 435
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
