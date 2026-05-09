; DESCRIPTION: Renders a cyan box of size 72x32 starting at (53, 220).
; PLAN: r0=53(x), r1=220(y), r2=72(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 220
LDI r2, 72
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
