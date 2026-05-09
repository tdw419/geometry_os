; DESCRIPTION: Renders a cyan line between points (18, 82) and (96, 215).
; PLAN: r0=18(x1), r1=82(y1), r2=96(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 82
LDI r2, 96
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
