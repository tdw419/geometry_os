; DESCRIPTION: Renders a cyan line between points (461, 146) and (154, 196).
; PLAN: r0=461(x1), r1=146(y1), r2=154(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 146
LDI r2, 154
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
