; DESCRIPTION: Fills the entire screen with solid black.
; PLAN: r0=0x000000(color). Op: FILL r0.
LDI r0, 0x000000
FILL r0
HALT
