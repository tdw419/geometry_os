; DESCRIPTION: Renders a cyan line between points (435, 82) and (69, 177).
; PLAN: r0=435(x1), r1=82(y1), r2=69(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 82
LDI r2, 69
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
