; DESCRIPTION: Places a red 55x48 rectangle at position (310, 199).
; PLAN: r0=310(x), r1=199(y), r2=55(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 199
LDI r2, 55
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
