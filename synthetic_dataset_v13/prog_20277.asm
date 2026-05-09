; DESCRIPTION: Renders a cyan box of size 63x116 starting at (198, 128).
; PLAN: r0=198(x), r1=128(y), r2=63(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 128
LDI r2, 63
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
