; DESCRIPTION: Places a green 35x76 rectangle at position (415, 48).
; PLAN: r0=415(x), r1=48(y), r2=35(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 48
LDI r2, 35
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
