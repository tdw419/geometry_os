; DESCRIPTION: Renders a cyan line between points (346, 159) and (50, 171).
; PLAN: r0=346(x1), r1=159(y1), r2=50(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 159
LDI r2, 50
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
