; DESCRIPTION: Places a green 113x29 rectangle at position (199, 59).
; PLAN: r0=199(x), r1=59(y), r2=113(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 59
LDI r2, 113
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
