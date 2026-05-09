; DESCRIPTION: Renders a cyan line between points (450, 126) and (446, 74).
; PLAN: r0=450(x1), r1=126(y1), r2=446(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 126
LDI r2, 446
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
