; DESCRIPTION: Places a cyan 100x28 rectangle at position (404, 49).
; PLAN: r0=404(x), r1=49(y), r2=100(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 49
LDI r2, 100
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
