; DESCRIPTION: Renders a red line between points (446, 228) and (308, 190).
; PLAN: r0=446(x1), r1=228(y1), r2=308(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 228
LDI r2, 308
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
