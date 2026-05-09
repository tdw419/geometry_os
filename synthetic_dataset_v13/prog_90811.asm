; DESCRIPTION: Renders a cyan box of size 61x32 starting at (230, 8).
; PLAN: r0=230(x), r1=8(y), r2=61(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 8
LDI r2, 61
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
