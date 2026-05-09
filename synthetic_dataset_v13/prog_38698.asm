; DESCRIPTION: Renders a cyan line between points (111, 221) and (275, 125).
; PLAN: r0=111(x1), r1=221(y1), r2=275(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 221
LDI r2, 275
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
