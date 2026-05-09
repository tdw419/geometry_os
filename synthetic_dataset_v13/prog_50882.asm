; DESCRIPTION: Renders a cyan line between points (234, 194) and (59, 166).
; PLAN: r0=234(x1), r1=194(y1), r2=59(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 194
LDI r2, 59
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
