; DESCRIPTION: Renders a cyan line between points (281, 55) and (394, 24).
; PLAN: r0=281(x1), r1=55(y1), r2=394(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 55
LDI r2, 394
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
