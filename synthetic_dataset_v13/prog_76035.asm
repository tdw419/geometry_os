; DESCRIPTION: Places a yellow 110x44 rectangle at position (199, 134).
; PLAN: r0=199(x), r1=134(y), r2=110(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 134
LDI r2, 110
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
