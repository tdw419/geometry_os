; DESCRIPTION: Renders a cyan box of size 30x59 starting at (434, 0).
; PLAN: r0=434(x), r1=0(y), r2=30(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 0
LDI r2, 30
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
