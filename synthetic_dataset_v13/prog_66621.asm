; DESCRIPTION: Renders a cyan line between points (485, 210) and (494, 249).
; PLAN: r0=485(x1), r1=210(y1), r2=494(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 210
LDI r2, 494
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
