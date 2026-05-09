; DESCRIPTION: Renders a cyan line between points (246, 73) and (290, 42).
; PLAN: r0=246(x1), r1=73(y1), r2=290(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 73
LDI r2, 290
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
