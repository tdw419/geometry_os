; DESCRIPTION: Places a green 12x59 rectangle at position (173, 177).
; PLAN: r0=173(x), r1=177(y), r2=12(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 177
LDI r2, 12
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
