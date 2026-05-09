; DESCRIPTION: Renders a cyan line between points (218, 249) and (126, 32).
; PLAN: r0=218(x1), r1=249(y1), r2=126(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 249
LDI r2, 126
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
