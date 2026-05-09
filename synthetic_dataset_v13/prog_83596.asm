; DESCRIPTION: Places a magenta 78x120 rectangle at position (173, 33).
; PLAN: r0=173(x), r1=33(y), r2=78(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 33
LDI r2, 78
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
