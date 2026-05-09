; DESCRIPTION: Places a cyan 72x32 rectangle at position (247, 164).
; PLAN: r0=247(x), r1=164(y), r2=72(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 164
LDI r2, 72
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
