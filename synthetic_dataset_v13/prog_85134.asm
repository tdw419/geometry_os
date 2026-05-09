; DESCRIPTION: Renders a cyan line between points (32, 32) and (327, 92).
; PLAN: r0=32(x1), r1=32(y1), r2=327(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 32
LDI r2, 327
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
