; DESCRIPTION: Renders a orange line between points (295, 27) and (228, 171).
; PLAN: r0=295(x1), r1=27(y1), r2=228(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 27
LDI r2, 228
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
