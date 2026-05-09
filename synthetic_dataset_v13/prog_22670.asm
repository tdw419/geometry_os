; DESCRIPTION: Draws a cyan line from (305, 38) to (308, 14).
; PLAN: r0=305(x1), r1=38(y1), r2=308(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 38
LDI r2, 308
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
