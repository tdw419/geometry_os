; DESCRIPTION: Places a cyan 37x17 rectangle at position (404, 135).
; PLAN: r0=404(x), r1=135(y), r2=37(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 135
LDI r2, 37
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
