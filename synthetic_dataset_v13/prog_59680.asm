; DESCRIPTION: Places a cyan 38x48 rectangle at position (199, 29).
; PLAN: r0=199(x), r1=29(y), r2=38(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 29
LDI r2, 38
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
