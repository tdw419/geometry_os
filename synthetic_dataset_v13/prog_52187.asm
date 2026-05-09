; DESCRIPTION: Renders a cyan box of size 64x50 starting at (120, 48).
; PLAN: r0=120(x), r1=48(y), r2=64(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 48
LDI r2, 64
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
