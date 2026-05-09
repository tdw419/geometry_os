; DESCRIPTION: Renders a cyan line between points (100, 228) and (182, 24).
; PLAN: r0=100(x1), r1=228(y1), r2=182(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 228
LDI r2, 182
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
