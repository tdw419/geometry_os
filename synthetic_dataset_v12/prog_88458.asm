; DESCRIPTION: Places a cyan 45x11 rectangle at position (92, 209).
; PLAN: r0=92(x), r1=209(y), r2=45(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 209
LDI r2, 45
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
