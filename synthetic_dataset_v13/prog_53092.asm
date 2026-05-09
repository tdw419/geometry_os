; DESCRIPTION: Sets the background to cyan.
; PLAN: r0=0x00FFFF(color). Op: FILL r0.
LDI r0, 0x00FFFF
FILL r0
HALT
