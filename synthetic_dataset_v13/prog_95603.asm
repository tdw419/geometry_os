; DESCRIPTION: Renders a cyan line between points (320, 18) and (504, 171).
; PLAN: r0=320(x1), r1=18(y1), r2=504(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 18
LDI r2, 504
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
