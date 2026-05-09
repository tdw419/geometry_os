; DESCRIPTION: Places a red 111x89 rectangle at position (199, 100).
; PLAN: r0=199(x), r1=100(y), r2=111(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 100
LDI r2, 111
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
