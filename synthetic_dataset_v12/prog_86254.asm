; DESCRIPTION: Places a cyan 106x11 rectangle at position (280, 5).
; PLAN: r0=280(x), r1=5(y), r2=106(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 5
LDI r2, 106
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
