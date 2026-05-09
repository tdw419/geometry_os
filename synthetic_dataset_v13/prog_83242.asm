; DESCRIPTION: Places a green 92x30 rectangle at position (104, 210).
; PLAN: r0=104(x), r1=210(y), r2=92(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 210
LDI r2, 92
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
