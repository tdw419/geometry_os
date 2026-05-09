; DESCRIPTION: Renders a cyan box of size 16x72 starting at (200, 113).
; PLAN: r0=200(x), r1=113(y), r2=16(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 113
LDI r2, 16
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
