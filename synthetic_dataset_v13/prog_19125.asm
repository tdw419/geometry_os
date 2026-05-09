; DESCRIPTION: Renders a cyan line between points (116, 146) and (346, 52).
; PLAN: r0=116(x1), r1=146(y1), r2=346(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 146
LDI r2, 346
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
